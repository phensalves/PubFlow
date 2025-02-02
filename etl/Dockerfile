# Dockerfile for etl (Airflow)
FROM apache/airflow:2.6.3-python3.8

# Define working directory
WORKDIR /opt/airflow

# Copy project dependencies
COPY requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Copy remaining project files
COPY dags /opt/airflow/dags

# Expose Airflow port
EXPOSE 8080

# Default command
CMD ["bash", "-c", "airflow db init && airflow webserver"]
