from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

# Define a simple DAG
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
    'catchup': False
}

def print_hello():
    print("Hello, Airflow!")

with DAG('example_dag',
         default_args=default_args,
         schedule_interval='@daily',
         catchup=False) as dag:

    task = PythonOperator(
        task_id='print_hello',
        python_callable=print_hello
    )
