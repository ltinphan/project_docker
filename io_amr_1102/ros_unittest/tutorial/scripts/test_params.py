#! /usr/bin/env python

import unittest
import rospy
import rostest

class MytestCase(unittest.TestCase):
    def test_param_loaded(self):
        value = rospy.get_param('/value', None)
        self.assertIsNotNone(value)

if __name__ == '__main__':
    rospy.init_node('test_params', anonymous=True)
   # rostest.rosrun('tutorial','test_params',MytestCase)
    value = rospy.get_param('/value', None)
    rospy.loginfo("hello value is: %d",value)


