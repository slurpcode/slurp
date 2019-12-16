"""Attempt at XML parsing with Python sax parser."""
import defusedxml.sax as sax

parser = sax.make_parser()  # pylint: disable=invalid-name
parser.parse(open(''))
