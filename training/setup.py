import setuptools

setuptools.setup(
    name="refit",
    version=str("1.0.0"),
    author="Matthew Alvarez",
    author_email="author@example.com",
    description="REFIT",
    long_description='',
    long_description_content_type="text/markdown",
    url="https://github.com/refit-ml/refit",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Framework :: Pytest"
    ],
    python_requires='>=3.6',
)