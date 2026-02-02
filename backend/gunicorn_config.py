# Gunicorn configuration file for production deployment
# Run with: gunicorn -c gunicorn_config.py server:app

import os
import multiprocessing

# Server socket
bind = f"0.0.0.0:{os.environ.get('PORT', '4567')}"
backlog = 2048

# Worker processes
workers = 2  # 2 workers for production
worker_class = 'sync'
worker_connections = 1000
timeout = 120
keepalive = 5

# Restart workers after this many requests to prevent memory leaks
max_requests = 1000
max_requests_jitter = 50

# Logging
accesslog = '-'  # Log to stdout
errorlog = '-'   # Log to stderr
loglevel = 'info'
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'

# Process naming
proc_name = 'ds_evaluator'

# Server mechanics
daemon = False
pidfile = None
umask = 0
user = None
group = None
tmp_upload_dir = None

# SSL (if needed)
# keyfile = None
# certfile = None
