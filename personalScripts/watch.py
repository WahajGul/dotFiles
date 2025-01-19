import time
from os import system


def stopwatch():
    seconds = 0
    try:
        while True:
            system("clear")
            hrs, mins, secs = seconds // 3600, (seconds % 3600) // 60, seconds % 60
            print(f"{hrs:02}:{mins:02}:{secs:02}".center(50))
            time.sleep(1)
            seconds += 1
    except KeyboardInterrupt:
        print("\nStopwatch stopped.")


stopwatch()
