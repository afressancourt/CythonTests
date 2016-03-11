import cython
from collections import deque
# from Queue import deque

def main():
    dq = deque()
    cdef int i, t, result
    cdef int N = 1000000
    cdef int M = 1000

    dqget = dq.pop

    dqput = dq.append

    for t in range(M):
        for i in range(N):
            dqput(i)

        while dq:
            result = dqget()


if __name__ == '__main__':
    main()
