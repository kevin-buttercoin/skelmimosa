request = require 'request'
logger = require 'logmimosa'

exports.retrieveRegistry = (callback) ->
  request 'https://raw.github.com/dbashford/mimosa-skeleton/master/registry.json', (error, response, body) ->
    if not error and response.statusCode is 200
      try
        registry = JSON.parse body
        callback registry
      catch err
        logger.error "Regsitry JSON failed to parse: #{err}"
    else
      logger.error "Problem retrieving registry JSON: #{error}"
