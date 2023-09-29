FROM python:3.10
ENV PORT=8080
COPY . .
RUN pip install pipenv
RUN pipenv install --deploy --ignore-pipfile
EXPOSE 8080
CMD ["pipenv", "run", "python","app.py"]