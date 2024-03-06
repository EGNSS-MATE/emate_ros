from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup


d = generate_distutils_setup(
    name="emate_mock_fusion",
    version="0.0.0",
    packages=["emate_mock_fusion"],
    package_dir={"": "src"},
    url="",
    license="TODO",
    author_email="andreas.bomonti@sbb.ch",
    description="Mock fusion node for EGNSS MATE",
)
setup(**d)