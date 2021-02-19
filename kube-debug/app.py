import os
import random

from flask import Flask

app = Flask("hello")

SECRET_SEED = int(os.environ["SECRET_SEED"])
random.seed(SECRET_SEED)


@app.route("/healthz")
def healthz():
    return "OK"


@app.route("/roll")
def roll():
    return {"result": random.choice((1, 2, 3, 4, 5, 6))}
