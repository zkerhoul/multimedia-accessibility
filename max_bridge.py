# max_bridge.py
from pythonosc import udp_client, dispatcher, osc_server
import threading
import time

class MaxBridge:
    def __init__(self, max_ip="127.0.0.1", send_port=8000, listen_ip="127.0.0.1", listen_port=8001):
        self.client = udp_client.SimpleUDPClient(max_ip, send_port)
        self.listen_ip = listen_ip
        self.listen_port = listen_port
        self._server = None
        self._dispatcher = dispatcher.Dispatcher()
        self._dispatcher.set_default_handler(self._default_handler)

    def send_track_control(self, track_name, vol, pan, low, mid, high,shift):
        base = f"/{track_name}"
        try:
            self.client.send_message(f"{base}/vol", float(vol))
            self.client.send_message(f"{base}/pan", float(pan))
            self.client.send_message(f"{base}/eq/low", float(low))
            self.client.send_message(f"{base}/eq/mid", float(mid))
            self.client.send_message(f"{base}/eq/high", float(high))
            self.client.send_message(f"{base}/shift", float(shift))
        except Exception as e:
            print("OSC send error:", e)

    def send_pre_eq(self, bands_dict):
        try:
            for name, gain in bands_dict.items():
                self.client.send_message(f"/pre_eq/{name}", float(gain))
        except Exception as e:
            print("OSC send error:", e)

    def send_transport(self, cmd):
        # cmd: "play", "stop", "seek", or numeric seconds for seek
        try:
            self.client.send_message("/transport/cmd", str(cmd))
        except Exception as e:
            print("OSC send error:", e)

    def _default_handler(self, address, *args):
        # recieve messages from max
        print(f"OSC RECV {address}: {args}")

    def start_server(self):
        # start OSC server to receive messages from Max (if ever needed)
        try:
            self._server = osc_server.ThreadingOSCUDPServer(
                (self.listen_ip, self.listen_port), self._dispatcher
            )
            t = threading.Thread(target=self._server.serve_forever, daemon=True)
            t.start()
            print(f"MaxBridge: OSC server listening on {self.listen_ip}:{self.listen_port}")
        except Exception as e:
            print("Failed to start OSC server:", e)

    def add_handler(self, address, func):
        self._dispatcher.map(address, func)

    def shutdown(self):
        if self._server:
            self._server.shutdown()
            self._server.server_close()
            self._server = None
