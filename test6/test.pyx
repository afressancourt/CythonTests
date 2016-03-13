#cython: boundscheck=False
#cython: wraparound=False
#cython: nonecheck=False
#cython: cdivision=True

cimport cqueue

cdef class Queue:

    cdef cqueue.Queue* _c_queue

    def __cinit__(self):
        self._c_queue = cqueue.queue_new()
        if self._c_queue is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_queue is not NULL:
            cqueue.queue_free(self._c_queue)

    cpdef int append(self, int value) except -1:
        if not cqueue.queue_push_tail(self._c_queue, <void*>value):
            raise MemoryError()
        return 0

    cdef int extend(self, int* values, Py_ssize_t count) except -1:
        cdef Py_ssize_t i
        for i in range(count):
            if not cqueue.queue_push_tail(self._c_queue, <void*>values[i]):
                raise MemoryError()
        return 0

    cpdef int peek(self) except? 0:
        cdef int value = <int>cqueue.queue_peek_head(self._c_queue)
        if value == 0:
            # this may mean that the queue is empty, or that it
            # happens to contain a 0 value
            if cqueue.queue_is_empty(self._c_queue):
                raise IndexError("Queue is empty")
        return value

    cpdef int pop(self) except? 0:
        cdef int value = <int>cqueue.queue_pop_head(self._c_queue)
        if value == 0:
            # this may mean that the queue is empty, or that it
            # happens to contain a 0 value
            if cqueue.queue_is_empty(self._c_queue):
                raise IndexError("Queue is empty")
        return value

    def __bool__(self):    # same as __nonzero__ in Python 2.x
        return not cqueue.queue_is_empty(self._c_queue)

cdef cmain():
    cdef Queue dq = Queue()
    cdef int i, t, result
    cdef int N = 1000000
    cdef int M = 1000

    for t in range(M):
        for i in range(N):
            dq.append(i)

        while dq:
            result = dq.pop()

def main():
    cmain()

if __name__ == '__main__':
    main()
