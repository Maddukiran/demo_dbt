from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

# Define the DAG
dag = DAG(
    'basic_bash_dag',
    description='A basic DAG with BashOperators',
    schedule_interval='0 0 * * *',  # Runs daily at midnight
    start_date=datetime(2023, 5, 17),
    catchup=False
)

# Define the tasks
task1 = BashOperator(
    task_id='task1',
    bash_command='echo "Running task 1"',
    dag=dag
)

task2 = BashOperator(
    task_id='task2',
    bash_command='echo "Running task 2"',
    dag=dag
)

task3 = BashOperator(
    task_id='task3',
    bash_command='echo "Running task 3"',
    dag=dag
)

# Define the task dependencies
task1 >> task2
task1 >> task3

