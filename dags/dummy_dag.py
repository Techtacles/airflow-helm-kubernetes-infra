from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.dummy import DummyOperator
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta


default_args = {
   'start_date': datetime(2023,6,29),
   'owner': 'Airflow'
}



with DAG(dag_id='dag_pipeline', schedule_interval="@daily", default_args=default_args) as dag:
    start_task = DummyOperator(task_id='start_task')
    task_1 = DummyOperator(task_id='task_1', dag=dag)
    echo_something=BashOperator(bash_command="echo proceeding to the final task")
    end_task = DummyOperator(task_id='end_task')
    start_task >> task_1 >> echo_something >> end_task
