FROM python:3.12-bullseye

WORKDIR /app
ENV PYTHONPATH=/app
RUN pip install --user poetry
ADD . /app
ENV PATH="${PATH}:/root/.local/bin"
RUN poetry install
RUN poetry config installer.max-workers 10

EXPOSE 8080
CMD ["poetry", "run", "python", "manage.py", "runserver"]