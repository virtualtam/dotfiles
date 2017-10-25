--- Return the name of an active Python virtualenv
function get_virtualenv(env_var)
    env_path = clink.get_env(env_var)
    if env_path then
        basen = exports.basename(env_path)
        return basen
    end
    return false
end

--- Custom prompt definition
function custom_prompt()
  cwd = clink.get_cwd()
  venv = get_virtualenv("VIRTUAL_ENV")

  prompt = "\x1b[1;32;40m{cwd} {git}{hg} \n\x1b[1;30;40m{time} {venv}{lamb} \x1b[0m"
  if venv then
      prompt = string.gsub(prompt, "{venv}", "("..venv..") ")
  else
      prompt = string.gsub(prompt, "{venv}", "")
  end
  prompt = string.gsub(prompt, "{cwd}", cwd)
  prompt = string.gsub(prompt, "{time}", os.date("%Y-%m-%d %X"))

  clink.prompt.value = string.gsub(prompt, "{lamb}", "λ")
end

clink.prompt.register_filter(custom_prompt, 1)
