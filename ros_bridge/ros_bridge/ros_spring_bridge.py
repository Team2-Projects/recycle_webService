import rclpy
from rclpy.node import Node

from sensor_msgs.msg import BatteryState
from nav_msgs.msg import Odometry

import websocket
import json


class SpringBridge(Node):

    def __init__(self):
        super().__init__('spring_bridge')

        self.ws = websocket.WebSocket()
        self.ws.connect("ws://192.168.0.16:8080/robot")

        self.subscription_battery = self.create_subscription(
            BatteryState,
            '/battery_state',
            self.battery_callback,
            10
        )

        self.subscription_odom = self.create_subscription(
            Odometry,
            '/odom',
            self.odom_callback,
            10
        )


    def battery_callback(self, msg):

        data = {
            "type": "battery",
            "battery": msg.percentage * 100
        }
        self.ws.send(json.dumps(data))
        
        self.get_logger().info(str(data))

    def odom_callback(self, msg):
        data = {
            "type": "odom",
            "x": msg.pose.pose.position.x,
            "y": msg.pose.pose.position.y,
            "speed": msg.twist.twist.linear.x
        }
        self.ws.send(json.dumps(data))
        
        self.get_logger().info(str(data))


def main():
    rclpy.init()
    node = SpringBridge()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()