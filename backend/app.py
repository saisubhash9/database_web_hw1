#Python HTTP server for GraphQL.
from flask import Flask,render_template, url_for
from flask_graphql import GraphQLView
from domains import schema
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

app.add_url_rule('/domains/', view_func=GraphQLView.as_view('graphql',
                  schema=schema, graphiql=True))



# @app.route('/')
# def home():
#    return render_template('index.html')

app.run(debug=True)