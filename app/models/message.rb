# Web Socket
class Message < ApplicationRecor


  after_create_commit { MessageBroadcastJob.perform_later self }


end