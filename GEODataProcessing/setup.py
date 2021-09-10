
try:
    from setuptools import setup
except ImportError as e:
    print('Please install python setuptools, '
          'https://packaging.python.org/tutorials/installing-packages/#use-pip-for-installing ')
    raise e

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(name='GEODataProcessing',
      version='0.0.1',
      description='Processing scripts for GEO methylation data',
      long_description=long_description,
      long_description_content_type="text/markdown",
      author='Colin P. Farrell',
      author_email='colinpfarrell@gmail.com',
      packages=['GEODataProcessing'],
      classifiers=['Programming Language :: Python :: 3.6',
                   'Programming Language :: Python :: 3.7',
                   'Programming Language :: Python :: 3.8'],
      platforms=["Linux", "Mac OS-X", "Unix"],
      requires=['numpy', 'sklearn'],
      install_requires=['numpy>=1.16.3', 'setuptools>=46.0.0', 'scikit-learn>=0.22.0'],
      python_requires='>=3.6',
      test_suite='tests',
      # include_package_data=True,
      zip_safe=True
      )
