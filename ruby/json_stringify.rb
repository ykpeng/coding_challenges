def json_stringify(arg, opts = { only: nil, except: nil })
  if arg.is_a?(Numeric) || arg.is_a?(TrueClass) || arg.is_a?(FalseClass) || arg.is_a?(Symbol)
    arg.to_s
  elsif arg.nil?
    'null'
  elsif arg.is_a?(String)
    '"' + arg + '"'
  elsif arg.is_a?(Array)
    arr_vals = []
    arg.each do |el|
      arr_vals << json_stringify(el)
    end
    '[' + arr_vals.join(',') + ']'
  elsif arg.is_a?(Hash)
    hash_vals = []
    arg.each do |key, val|
      key_val_pair = json_stringify(key) + ':' + json_stringify(val)
      hash_vals.push(key_val_pair)
    end
    '{' + hash_vals.join(',') + '}'
  end
end

p json_stringify({});                  # '{}'
p json_stringify(true);                # 'true'
p json_stringify('foo');               # '"foo"'
p json_stringify([1, 'false', false]); # '[1,"false",false]'
p json_stringify({ "x" => 5 });            # '{"x":5}'
