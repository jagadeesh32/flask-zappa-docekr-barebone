FROM amazon/aws-lambda-python:3.8

ARG FUNCTION_DIR="/var/task/"

COPY ./ ${FUNCTION_DIR}

RUN pip install -r requirements.txt


RUN ZAPPA_HANDLER_PATH=$( \
    python -c "from zappa import handler; print (handler.__file__)" \
    ) \
    && echo $ZAPPA_HANDLER_PATH \
    && cp $ZAPPA_HANDLER_PATH ${FUNCTION_DIR}


CMD [ "handler.lambda_handler" ]
