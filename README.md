My configurations.
Don't foget the hidden files.


"""Progress bar
"""
from time import sleep

global_var = 123

def progress_bar(my_range: int, i: int=None, width: int=100):
    """Progress bar
    Args:
        my_range (int): loop range
        i (int): iterator
        width (int): width of progress bar

    Returns:
        None
    """
    unit = width / my_range
    pc = int((i + 1) * unit)
    print(('=' * (pc - 1)) + '|' + ' '*(width - pc)+ '|' + '{0:.2f}'.format((i + 1) / my_range * 100) + '%', end='\r', flush=True)

if __name__ == '__main__':
    for i in range(123):
        progress_bar(123, i)
        sleep(0.1)
