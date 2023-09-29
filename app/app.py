import os
from operator import truediv

from flask import Flask, render_template

app = Flask(__name__)


#index
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/faq')
def faq():
    return render_template('faq.html')

@app.route('/bookingfee')
def bookingfee():
    return render_template('bookingfee.html')

@app.route('/familyties')
def familyties():
    return render_template('familyties.html')

@app.route('/holidayseasons')
def holidayseasons():
    return render_template('holidayseasons.html')

@app.route('/lovestuff')
def lovestuff():
    return render_template('lovestuff.html')

@app.route('/milestones')
def milestones():
    return render_template('milestones.html')

@app.route('/otherstuff')
def otherstuff():
    return render_template('otherstuff.html')

@app.route('/youniques')
def youniques():
    return render_template('youniques.html')

@app.route('/tinyhumans')
def tinyhumans():
    return render_template('tinyhumans.html')

@app.route('/weddings')
def weddings():
    return render_template('weddings.html')

@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404

@app.errorhandler(500)
def page_not_found(error):
    return render_template('500.html'), 500


if __name__ =='__main__':
    app.run(host='0.0.0.0', port=os.environ.get("PORT"))