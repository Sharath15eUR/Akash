# Akash S Networking Assignment - embedUR

## 1) File Transfer Between Systems

**Understanding:**  
- Both `cp` and `scp` are used to copy files, but they serve different purposes based on local or remote operations.  
  - **cp:**  
    - Used to copy files or folders locally on a Linux system.  
    - `cp -r source destination` recursively copies a folder and its contents.  
    - Simple and fast for local operations.  
  - **scp:**  
    - Securely copies files between local and remote systems over SSH.  
    - `scp -r source user@remote:/path` transfers a folder recursively.  
    - Ensures encrypted data transfer.  

**Outputs:**  
![Output 1a](Outputs/Mod1Output1a.jpg)  
![Output 1b](Outputs/Mod1Output1b.jpg)  
![Output 1c](Outputs/Mod1Output1c.jpg)

## 2) Hosting FTP and SFTP Servers

**Understanding:**  
- FTP and SFTP allow file transfers, with SFTP being more secure due to encryption.  
- I hosted both servers and tested `PUT` (upload) and `GET` (download) operations.  
- `ftp` or `sftp` commands connect to the server using a hostname.  
- It’s a practical way to manage remote files.  
- SFTP is preferred for sensitive data.  

**Outputs:**  
![Output 2a](Outputs/Mod1Output2a.jpg)  
![Output 2b](Outputs/Mod1Output2b.jpg)  
![Output 2c](Outputs/Mod1Output2c.jpg)

## 3) Packet Analysis with Networking Tools

**Understanding:**  
- Tools like Wireshark, tcpdump, and Cisco Packet Tracer capture and analyze network packets.  
- They reveal packet details like headers and protocols.  
- Filters narrow down traffic (e.g., by IP or port).  
- I used them to study network behavior.  
- It’s like decoding network communication.  

**Outputs:**  
![Output 3a](Outputs/Mod1Output3a.jpg)  
![Output 3b](Outputs/Mod1Output3b.jpg)  
![Output 3c](Outputs/Mod1Output3c.jpg)  
![Output 3d](Outputs/Mod1Output3d.jpg)  
![Output 3e](Outputs/Mod1Output3e.jpg)  
![Output 3f](Outputs/Mod1Output3f.jpg)

## 4) Linux Networking Utilities

**Understanding:**  
- Commands like `ping`, `arp`, and `ifconfig` help monitor and troubleshoot networks.  
  - **ping:**  
    - Tests connectivity to a host (e.g., `ping -c 4 8.8.8.8`).  
    - Measures latency and packet loss.  
  - **arp:**  
    - Displays IP-to-MAC address mappings (e.g., `arp -a`).  
    - Useful for resolving address conflicts.  
  - **ifconfig:**  
    - Shows network interface details like IP and status.  
    - Helps check configuration and stats.  

**Outputs:**  
![Output 4a](Outputs/Mod1Output4a.jpg)  
![Output 4b](Outputs/Mod1Output4b.jpg)  
![Output 4c](Outputs/Mod1Output4c.jpg)

## 5) Duplicate IPs in a Network

**Understanding:**  
- Duplicate IPs create conflicts, breaking network communication.  
- Devices with the same IP confuse routing and cause packet loss.  
- I simulated this and saw errors or unreachable hosts.  
- Tools like `arp` help detect duplicates.  
- Unique IPs are essential for stability.  

**Outputs:**  
![Output 5](Outputs/Mod1Output5.jpg)

## 6) Remote System Access

**Understanding:**  
- Tools like VNC Viewer, AnyDesk, TeamViewer, and Remote Desktop enable remote GUI access.  
  - **VNC Viewer:**  
    - Uses a server-client model with IP and port.  
    - Provides full desktop control.  
  - **AnyDesk:**  
    - Simple setup with unique IDs for connection.  
    - Fast and lightweight.  
  - **TeamViewer:**  
    - Similar to AnyDesk, with ID-based access.  
    - Good for cross-platform use.  
  - **Remote Desktop:**  
    - Built into Windows, uses IP and credentials.  
    - Seamless for Windows networks.  

**Outputs:**  
![Output 6a](Outputs/Mod1Output6a.jpg)  
![Output 6b](Outputs/Mod1Output6b.jpg)  
![Output 6c](Outputs/Mod1Output6c.jpg)  
![Output 6d](Outputs/Mod1Output6d.jpg)  
![Output 6e](Outputs/Mod1Output6e.jpg)  
![Output 6f](Outputs/Mod1Output6f.jpg)  
![Output 6g](Outputs/Mod1Output6g.jpg)  
![Output 6h](Outputs/Mod1Output6h.jpg)  
![Output 6i](Outputs/Mod1Output6i.jpg)  
![Output 6j](Outputs/Mod1Output6j.jpg)

## 7) Default Gateway Reachability

**Understanding:**  
- The default gateway routes traffic outside the local network.  
- `ping gateway_ip` tests if it’s reachable.  
- Failure indicates misconfiguration or outage.  
- `route -n` or `ip route` shows the gateway.  
- It’s key to internet access.  

**Outputs:**  
![Output 7](Outputs/Mod1Output7.jpg)

## 8) Network Interface Details

**Understanding:**  
- Both `ifconfig` and `iwconfig` provide network interface details, but they focus differently.  
  - **ifconfig:**  
    - Displays IP, status, and stats for all interfaces.  
    - Shows speed and MTU settings.  
  - **iwconfig:**  
    - Focuses on wireless interfaces (e.g., signal strength).  
    - Useful for Wi-Fi troubleshooting.  

**Outputs:**  
![Output 8a](Outputs/Mod1Output8a.jpg)  
![Output 8b](Outputs/Mod1Output8b.jpg)

## 9) Router Web Interface Exploration

**Understanding:**  
- Routers (e.g., 192.168.1.1) offer a web UI for management.  
- Logging in shows connected devices and IPs.  
- I checked my router’s device list.  
- It’s a hub for network monitoring.  
- Default credentials are often admin/admin.  

**Outputs:**  
![Output 9a](Outputs/Mod1Output9a.jpg)  
![Output 9b](Outputs/Mod1Output9b.jpg)

## 10) DHCP Server IP Assignment

**Understanding:**  
- DHCP assigns IPs dynamically to network devices.  
- It leases IPs from a pool via the DORA process.  
- I observed this in router logs or UI.  
- Reduces manual IP setup efforts.  
- Ensures efficient IP allocation.  

**Outputs:**  
![Output 10a](Outputs/Mod1Output10a.jpg)  
![Output 10b](Outputs/Mod1Output10b.jpg)

## 11) Remote Machine Access via SSH and Telnet

**Understanding:**  
- Both SSH and Telnet provide terminal access to remote machines, differing in security.  
  - **SSH:**  
    - Securely connects using `ssh user@host`.  
    - Encrypts data for safety.  
  - **Telnet:**  
    - Connects via `telnet host`, but it’s unencrypted.  
    - Risky for sensitive tasks.  

**Outputs:**  
![Output 11a](Outputs/Mod1Output11a.jpg)  
![Output 11b](Outputs/Mod1Output11b.jpg)

---

**Akash S**  
**embedUR**
