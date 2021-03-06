require "king_konf"

module DeliveryBoy
  class Config < KingKonf::Config
    prefix :delivery_boy

    # Basic
    list :brokers, items: :string, sep: ",", default: ["localhost:9092"]
    string :client_id, default: "delivery_boy"

    # Buffering
    integer :max_buffer_bytesize, default: 10_000_000
    integer :max_buffer_size, default: 1000
    integer :max_queue_size, default: 1000

    # Network timeouts
    integer :connect_timeout, default: 10
    integer :socket_timeout, default: 30

    # Delivery
    integer :ack_timeout, default: 5
    integer :delivery_interval, default: 10
    integer :delivery_threshold, default: 100
    integer :max_retries, default: 2
    integer :required_acks, default: -1
    integer :retry_backoff, default: 1

    # Compression
    integer :compression_threshold, default: 1
    string :compression_codec, default: nil

    # SSL authentication
    string :ssl_ca_cert, default: nil
    string :ssl_ca_cert_file_path
    string :ssl_client_cert, default: nil
    string :ssl_client_cert_key, default: nil

    # SASL authentication
    string :sasl_gssapi_principal
    string :sasl_gssapi_keytab
    string :sasl_plain_authzid
    string :sasl_plain_username
    string :sasl_plain_password

    # Datadog monitoring
    boolean :datadog_enabled
    string :datadog_host
    integer :datadog_port
    string :datadog_namespace
    list :datadog_tags
  end
end
