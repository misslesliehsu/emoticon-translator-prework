require "yaml"


def load_library(file)
  library = YAML.load_file(file) #{kiss => [":*", "(*^3^)/~☆"]}
  new_lib = {}
  new_lib["get_meaning"] = {}
  new_lib["get_emoticon"] = {}
  library.each do |meaning, eng_jap| #kiss, [":*", "(*^3^)/~☆"]
    new_lib["get_meaning"][eng_jap[1]] = meaning
    new_lib["get_emoticon"][eng_jap[0]] = eng_jap[1]
  end
  new_lib
end


def get_japanese_emoticon(file, emoticon)
  lib = load_library(file)
  answer = ""
  if lib["get_emoticon"].include?(emoticon)
    lib["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  lib = load_library(file)
  answer = lib["get_meaning"][emoticon]
  if answer == nil
    return "Sorry, that emoticon was not found"
  else
    return answer
  end
end
