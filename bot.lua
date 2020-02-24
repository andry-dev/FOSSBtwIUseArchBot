local api = require('telegram-bot-lua.core')
local lyaml = require('lyaml')

local function open_config(path)
    local file = io.open(path, "rb")
    if not file then
        return nil
    end

    local content = file:read "*a"
    file:close()

    return lyaml.load(content)
end

local config = open_config('config.yaml')

if not config then
    print('Error: Can\'t open config file!')
    os.exit()
end

local token = config['token']

if not token then
    print('Error: Can\'t find token in config file')
    os.exit()
end

api.configure(token)

function api.on_inline_query(inline_query)
    local results = {
        api.inline_result()
        :type('article')
        :id(1)
        :title('btw i use arch')
        :description('be an annoying fuck')
        :input_message_content(
            api.input_text_message_content('btw i use arch')
        ),

        api.inline_result()
        :type('article')
        :id(2)
        :title('btw i don\'t use arch')
        :description('be a normal human being')
        :input_message_content(
            api.input_text_message_content('btw i don\'t use arch')
        )
    }

    api.answer_inline_query(
        inline_query.id,
        results
    )

end

api.run()
