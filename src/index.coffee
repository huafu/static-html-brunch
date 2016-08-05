sysPath = require 'path'

module.exports = class StaticHtmlCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'html'
  pattern: /\.(?:html|htm)$/

  constructor: (@config) ->
    null

  compile: (data, path, callback) ->
    try
      replacements = @config?.plugins?.statichtml?.replacements
      for own r of replacements
        data = data.split("{{#{r}}}").join( replacements[r] )
      result = "module.exports = #{JSON.stringify(data)};"
    catch err
      error = err
    finally
      callback error, result

