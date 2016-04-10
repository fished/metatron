from flask_restful import Resource
import json
import logging
from metatron.model import Node
#from metatron.db import backend

logger = logging.getLogger("metatron.controller.node")
logger.setLevel(logging.DEBUG)


class NodeController(Resource):
    def on_get(self, req, resp, pk):
        quote = {
            'quote':
            'I\'ve always been more interested in the future than in the past.',
            'author': 'Grace Hopper',
            'pk': pk,
        }

        resp.body = json.dumps(quote)

    def post(self):
        try:
            raw_json = req.stream.read().decode("utf-8")
        except Exception as ex:
            raise falcon.HTTPError(falcon.HTTP_400, 'Error', ex.message)
        logger.debug("test")
        logger.debug(raw_json)

        try:
            result = json.loads(raw_json)
            node = Node(result)
            resp.body = 'Successfully inserted %s' % (id)
        except ValueError:
            raise falcon.HTTPError(falcon.HTTP_400, 'Invalid JSON',
                                   'Could not decode the request body. The '
                                   'JSON was incorrect.')
