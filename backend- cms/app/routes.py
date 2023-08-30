from flask import render_template, request, redirect, url_for
from app import app

# Sample data (for demonstration)
site_name = "My CMS"
current_year = 2023

# Routes
@app.route('/')
def home():
    return render_template('home.html', page_title='Home', site_name=site_name, current_year=current_year)

@app.route('/about')
def about():
    return render_template('about.html', page_title='About', site_name=site_name, current_year=current_year)

@app.route('/services')
def services():
    return render_template('services.html', page_title='Services', site_name=site_name, current_year=current_year)

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        # Handle form submission here (e.g., sending emails)
        return redirect(url_for('thank_you'))
    return render_template('contact.html', page_title='Contact', site_name=site_name, current_year=current_year)

@app.route('/thank-you')
def thank_you():
    return render_template('thank_you.html', page_title='Thank You', site_name=site_name, current_year=current_year)
