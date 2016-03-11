from collections import deque
# from Queue import deque


def main():
    dq = deque()
    N = 1000000
    M = 1000

    dqget = dq.pop
    dqput = dq.append

    for t in range(M):
        for i in range(N):
            dqput(i)

        while dq:
            result = dqget()


if __name__ == '__main__':
    main()
