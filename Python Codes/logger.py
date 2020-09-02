#   Simple testing playground with the logging library.
#   Goal: Learn how to create log files for Exception tracking.
#   ?

import logging

#LogRecord attributes python docs for more info on basicConfig(>>LogRecord attributes<<)
#logging.basicConfig(level=logging.DEBUG,format='%(asctime)s - %(message)s', datefmt='%m/%d/%y %H:%M:%S')
#logging.debug("ERROR")   #Test output

logger = logging.getLogger(__name__)

#create a handler
stream_h = logging.StreamHandler()              #sends logging output to streams such as sys.stdout, sys.stderr or any file-like object
file_h = logging.FileHandler('file.log')        #Logs only Errors, we can also add file.log to steam_h to log ...

#level and the format
stream_h.setLevel(logging.WARNING)
file_h.setLevel(logging.ERROR)

formatter = logging.Formatter('PATH: %(pathname)s  TIME: %(asctime)s  FUNCTION :%(name)s  %(message)s')
stream_h.setFormatter(formatter)
file_h.setFormatter(formatter)

#add configured handler to stream_h & file_h
logger.addHandler(stream_h)
logger.addHandler(file_h)

logger.warning('Warning: Exception at methodxx..')
logger.error('Error: Exception xxx..')
