from fastapi import FastAPI,HTTPException
from pydantic import BaseModel

# Create a FastAPI instance
app = FastAPI()

# Define a Pydantic model for the task
class Task(BaseModel):
    title: str
    description: str
    status: str

tasks = {}
task_id = 1

# Define the API endpoints for task management
@app.get('/')
def home():
    return {'message':'Task Management API'}

# Endpoint to add a new task
@app.post('/tasks')
def add_task(task: Task):
    global task_id

    data = { 'id':task_id, 'title':task.title, 'description':task.description, 'status':task.status }

    tasks[task_id] = data
    task_id += 1

    return { 'message':'Task added successfully', 'task':data }

# Endpoint to view all tasks
@app.get('/tasks')
def view_tasks():
    return list(tasks.values())

# Endpoint to view a specific task by ID
@app.get('/tasks/{id}')
def get_task(id: int):
    if id not in tasks:
        raise HTTPException(status_code=404,detail='Task not found')

    return tasks[id]

# Endpoint to update a task by ID
@app.put('/tasks/{id}')
def update_task(id: int,task: Task):
    if id not in tasks:
        raise HTTPException(status_code=404,detail='Task not found')

    tasks[id] = { 'id':id, 'title':task.title, 'description':task.description, 'status':task.status }

    return { 'message':'Task updated successfully', 'task':tasks[id] }


# Endpoint to delete a task by ID
@app.delete('/tasks/{id}')
def delete_task(id: int):
    if id not in tasks:
        raise HTTPException(status_code=404,detail='Task not found')

    deleted_task = tasks.pop(id)

    return { 'message':'Task deleted successfully', 'task':deleted_task }