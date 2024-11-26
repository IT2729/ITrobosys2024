#!/usr/bin/env python
from setuptools import setup, find_packages


setup(
    name="FKmanipulator.py",
    version="0.1.0",
    license="BSD-3-Clause",
    author="Itsuki Terasawa",
    url="https://github.com/IT2729/robosys2024",
    packages=find_packages(),
    entry_points = {
        'console_scripts': ['FKmanipulator = FKmanipulator.FKmanipulator:main']
    python_require='>=3.6',
)

