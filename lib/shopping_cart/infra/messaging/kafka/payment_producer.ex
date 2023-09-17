defmodule ShoppingCart.Infra.Messaging.Kafka.PaymentProducer do
  def enqueue(%{} = payment) do
    payment_jason = Jason.encode(payment)
    Kaffe.Producer.produce_sync("payments", payment_jason)
  end
end
