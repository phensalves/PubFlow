# Dockerfile for etl (Airflow)
FROM apache/airflow:2.5.0

# Define working directory
WORKDIR /opt/airflow

# Copy project dependencies
COPY etl/requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Copy remaining project files
COPY etl/dags /opt/airflow/dags

# Expose Airflow port
EXPOSE 8080

# Default command
CMD ["airflow", "webserver"]
