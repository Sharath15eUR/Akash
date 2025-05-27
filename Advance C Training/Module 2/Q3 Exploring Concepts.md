

## Question 3: Exploration Topics

---

### 🔹 1. Child Process - `fork()`

The `fork()` system call is used in Unix/Linux to create a new process. When called, it creates an exact copy of the current process (called the parent), and the new process (called the child) runs separately. The return value helps distinguish between the parent and child:
- Returns 0 to the child
- Returns child's PID to the parent

I tested this by writing a simple program where the child prints its PID and the parent waits. It’s useful for parallel execution and is the base for understanding how shells and daemons work.

---

### 🔹 2. Handling Common Signals

Signals are software interrupts sent to a process. Common signals include:
- `SIGINT` (Ctrl+C)
- `SIGTERM` (default kill)
- `SIGKILL` (force kill, cannot be caught)
- `SIGSEGV` (segmentation fault)

I used the `signal()` function in C to override the behavior of `SIGINT` in our thread program so that Ctrl+C does not stop the program. This helped me understand asynchronous behavior and how to write more robust code.

---

### 🔹 3. Exploring Kernel Crashes

Kernel crashes (often resulting in a kernel panic) occur when the Linux kernel encounters a fatal error from which it cannot safely recover. Common causes include:
- Bad memory access by a kernel module
- Infinite loops or deadlocks in kernel space
- Faulty drivers

To simulate and observe, I studied logs in `/var/log/kern.log` and used commands like `dmesg`. I also researched `Oops` messages which provide debug info on crashes. This topic is crucial for low-level debugging and writing kernel modules.

---

### 🔹 4. Time Complexity

Time complexity describes how the runtime of an algorithm grows with input size. In our thread program:
- Prime number summation has **O(n√n)** complexity due to checking for prime by dividing up to √n.
- The `Thread 1` and `Thread 2` print loops have constant time, based on the fixed 100 seconds of runtime.

Understanding time complexity helps optimize code, especially in embedded or low-resource environments.

---

### 🔹 5. Locking Mechanism - Mutex and Spinlock

When multiple threads access shared data, race conditions may occur. Locking mechanisms prevent this:

- **Mutex (Mutual Exclusion):**
  - Used to allow one thread at a time to access critical sections.
  - Blocks other threads until the mutex is unlocked.
  - Ideal for general multithreaded apps.

- **Spinlock:**
  - A lightweight lock where a thread continuously checks (spins) until the lock is released.
  - Uses more CPU but can be faster if wait time is very short.
  - Common in kernel-level programming.

Although our current thread program doesn’t use shared resources, I understood the theory and tested mutexes in another C program.

---

