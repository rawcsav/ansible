# filter_plugins/custom_filters.py

def seconds_to_time(seconds):
    m, s = divmod(seconds, 60)
    h, m = divmod(m, 60)
    return "{:02}:{:02}:{:02}".format(h, m, s)

def human_readable(size, decimal_places=2):
    for unit in ['B', 'KB', 'MB', 'GB', 'TB', 'PB']:
        if size < 1024.0:
            return f"{size:.{decimal_places}f} {unit}"
        size /= 1024.0
    return f"{size:.{decimal_places}f} PB"

class FilterModule(object):
    def filters(self):
        return {
            'seconds_to_time': seconds_to_time,
            'human_readable': human_readable,
        }
