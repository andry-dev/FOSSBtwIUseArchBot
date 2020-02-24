# FOSSBtwIUseArchBot

FOSS reimplementation of @BtwIUseArchBot on Telegram, written in Lua 5.3.

# Setup

Install luarocks for Lua 5.3 and install `lyaml` and `telegram-bot-lua`:

```
luarocks --server=http://rocks.moonscript.org install lyaml
luarocks install telegram-bot-lua
```

Then, rename (or copy) `config.yaml.example` to `config.yaml` and modify the token there.

# Running

Run the bot with `lua bot.lua`
