defmodule Guildship.Cldr do
  use Cldr,
    default_locale: "en",
    locales: ["en"],
    otp_app: :guildship,
    providers: [Cldr.Number, Cldr.DateTime, Cldr.Calendar, Cldr.Message],
    generate_docs: true
end
