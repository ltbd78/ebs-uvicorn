from fastapi import FastAPI
from sandbox.utils import add

app = FastAPI()

@app.get("/health")
def health():
    return "OK"

@app.get("/add")
def add_(a: int, b: int):
    return add(a, b)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000) #log_config=log_config)
