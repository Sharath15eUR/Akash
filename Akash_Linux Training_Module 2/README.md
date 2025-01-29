
# Akash_Linux Training Module 2

## Solutions

### Q1) List large files in the current directory
**Commands**:
```bash
ls -l | awk '$5 > 1048576 {print $9}' > 1M_largerfiles.txt
cat 1M_largerfiles.txt
```

**Explanation**:  
![Explanation](screenshots/Module 2 Explanation 1.jpg)  

**Output**:  
![Output](screenshots/q211.jpg)  
![Output](screenshots/q212.jpg)

---

### Q2) Replace localhost with 127.0.0.1 in a configuration file
**Commands**:
```bash
sed 's/localhost/127.0.0.1/g' config.txt > updated_config.txt
```

**Explanation**:  


**Output**:  
![Output](screenshots/q22.jpg)

---

### Q3) Filter log file to exclude lines containing DEBUG
**Commands**:
```bash
grep "ERROR" log.txt | grep -v "DEBUG" > filtered_log.txt
cat filtered_log.txt
```

**Explanation**:  


**Output**:  
![Output](screenshots/q23.jpg)

---

### Q4) Identify and terminate the process with the highest memory usage
**Commands**:
```bash
ps aux --sort=-%mem | awk 'NR==2 {print $0}'
kill -9 $(ps aux --sort=-%mem | awk 'NR==2 {print $2}')
```

**Explanation**:  


**Output**:  
![Output](screenshots/q24.jpg)

---

### Q5) Show available gateways
**Commands**:
```bash
netstat -rn
netstat -rn | awk '{print $3}' | sort
netstat -rn | grep '^0.0.0.0' | awk '{print $3}' | sort
```

**Explanation**:  


**Output**:  
![Output](screenshots/q25.jpg)

---
