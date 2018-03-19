require 'sinatra'
require 'sinatra/reloader'

get '/CaeserCipher' do


  message = "testing message."
  string = params["phrase"].to_s
  offset = params["offset"].to_i

  def caeser_cipher(offset, string)
    return_str =""
    alph = "abcdefghijklmnopqrstuvwxyz"
    cap_alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    string.split("").each {|c|
      if alph.include?(c)
        c_index = alph.index(c)
        new_pos = c_index + offset
        new_alph_index = new_pos % 26
        return_str = return_str + alph[new_alph_index]
      elsif cap_alph.include?(c)
        c_index = cap_alph.index(c)
        new_pos = c_index + offset
        new_alph_index = new_pos % 26
        return_str = return_str + cap_alph[new_alph_index]
      else
        return_str = return_str + c

      end
    }
    return return_str

    end

     message = caeser_cipher(offset, string)


    erb :index, :locals => {:message => message}




end
