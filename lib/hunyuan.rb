# frozen_string_literal: true

require "net/http"
require "openssl"
require "base64"
require "securerandom"
require "json"
require_relative "hunyuan/version"

module Hunyuan

  class ChatClient
    HOST = "hunyuan.cloud.tencent.com"
    PATH = "hyllm/v1/chat/completions"
    URL = "https://#{HOST}/#{PATH}"

    def initialize(app_id = ENV["HUNYUAN_APP_ID"],
                   secret_id = ENV["HUNYUAN_SECRET_ID"],
                   secret_key = ENV["HUNYUAN_SECRET_KEY"])
      @app_id = app_id
      @secret_id = secret_id
      @secret_key = secret_key
    end

    def chat(messages)
      request = build_request(messages)
      signature = generate_signature(sign_params(request))

      headers = {
        "Content-Type" => "application/json",
        "Authorization" => signature
      }

      puts "Request: #{URL} | #{headers} | #{request}"

      response = Net::HTTP.post(URI(URL), request.to_json, headers)

      puts "Response:"
      result = JSON.parse(response.body)
      puts result

      result
    end

    private

    def build_request(messages)
      {
        app_id: @app_id,
        secret_id: @secret_id,
        query_id: "test_query_id_#{SecureRandom.uuid}",
        messages: messages,
        temperature: 0,
        top_p: 0.8,
        stream: 0,
        timestamp: Time.now.to_i + 10_000,
        expired: Time.now.to_i + 24 * 60 * 60
      }
    end

    def generate_signature(params)
      query_string = params.sort.map { |k, v| "#{k}=#{v}" }.join("&")

      string_to_sign = "#{HOST}/#{PATH}?#{query_string}"

      digest = OpenSSL::Digest.new("sha1")
      hmac = OpenSSL::HMAC.digest(digest, @secret_key, string_to_sign)

      Base64.strict_encode64(hmac)
    end

    def sign_params(data)
      {
        app_id: data[:app_id],
        secret_id: data[:secret_id],
        query_id: data[:query_id],
        temperature: data[:temperature].to_s,
        top_p: data[:top_p].to_s,
        stream: data[:stream],
        messages: data[:messages].to_json,
        timestamp: data[:timestamp].to_s,
        expired: data[:expired].to_s
      }
    end
  end

end
