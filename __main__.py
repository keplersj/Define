# Bitdeli Widget Gallery
#
# This board serves as reference and a live demo for all the widgets
# currently available for Bitdeli scripts.

import bitdeli
from bitdeli.widgets import *

import random
from datetime import date, datetime, timedelta
from collections import Counter
from operator import attrgetter

DAYS = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']

# The set_theme method changes the color theme of the board. Each
# theme contains a background color and three foreground colors. To
# change the color of a widget, use the color option (details below).
bitdeli.set_theme('eighties')

# Widget reference:
#
# The rest of this script generates the actual widgets shown on the
# board. The widgets are shown on the board in the order they are
# created in the script.
#
# Options common to all widgets:
# label:  a string that will be shown in the top left
#         corner of a widget
# data:   the data to be displayed, format depends on the widget type
# size:   the size of the widget on the board (see below)
#         size=[x, y] where x and y are positive integer values
# color:  an integer between 1-3, picks a color from the current theme
# group:  define the widget group for this widget (see below)

# About board layout and widget sizing:
#
# The widgets are laid out on a grid that has 12 columns and infinite
# rows. The size option of a widget corresponds to these grid units,
# making 12 the maximum x size of a widget.

# Widget group:
# bitdeli.Group(options)
#
# A widget group can be used to take better control of how the widgets
# are positioned on a board. A widget group behaves like a single
# widget in the board layout.
#
# To add widgets to a group, use the group option when creating
# other widgets.
#
# Note that the size of a group is determined by its contents and can
# not be manually set.
#
# Options:
# layout:   "vertical" or "horizontal" (default)
#
# This group is used to make sure that the following line and bar
# charts stay together in the board layout
map_group = Group()
daily_group = Group(layout='vertical')

def create_map(stats):
    # Map widget:
    # bitdeli.Map(options)
    #
    # Displays a map with countries colored according to given data.
    # The color scale and map position are determined automatically.
    #
    # Options:
    # data:   a dictionary where keys are 2-letter country codes
    #         (ISO 3166-1 alpha-2) and values are numbers
    Map(label='Revenue by country',
        data=stats.countries,
        size=(5, 4),
        color=3,
        group=map_group)

def create_linechart(stats):
    # Line widget:
    # bitdeli.Line(options)
    #
    # Displays a line chart of time series data.
    #
    # Options:
    # data:   a list of (timestamp, value) tuples, where
    #         timestamp is a string in the ISO 8601 format
    #         and value is a number
    #
    # OR to show multiple series on the same chart:
    # data:   a list of {label, data} objects, where
    #         label is a string shown in the chart legend
    #         and data is a list of tuples as defined before
    all_sales, beer_sales = stats.sales_data()
    Line(label='Revenue for past 30 days',
         data=[{'label': 'total', 'data': all_sales},
               {'label': 'beer', 'data': beer_sales}],
         size=(7, 2),
         group=daily_group)

def create_barchart(stats):
    # Bar widget:
    # bitdeli.Bar(options)
    #
    # Displays an ordinal bar chart.
    #
    # Options:
    # data:   a list of (label, value) tuples, where
    #         label is the label for each bar on the x-axis
    #         value is a number determining the height of the bar
    Bar(label='% of beer sales from revenue',
        data=[(d, (100. * stats.daily_beer[d]) / stats.daily_sales[d])
              for d in DAYS],
        size=(5, 2),
        group=daily_group)
    # Empty widgets can be used as spacers
    Widget(size=(12, 1))
    
def create_text(stats):
    # Text widget:
    # bitdeli.Text(options)
    #
    # Displays a large colored text and/or a paragraph
    #
    # Options:
    # head:    a string that will be colored and fitted to be
    #          as large as the widget size allows
    # text:    a string that will be shown as a normal-sized paragraph
    #          below the heading
    top_group = Group(layout='vertical')
    best = stats.most_liked()
    Text(label='Top selling product',
         head=stats.sales.most_common(1)[0][0],
         color=3,
         size=(4, 1),
         group=top_group)

    Text(label='Most returns',
         head=stats.returns.most_common(1)[0][0],
         color=2,
         size=(4, 1),
         group=top_group)

    Text(label='Most liked product',
         head=best,
         color=1,
         size=(4, 1),
         group=top_group)

    Text(label='Most liked product',
         text="%d positive\n%d negative" %\
              (stats.feedback_pos.get(best, 0),
               stats.feedback_neg.get(best, 0)),
         size=(4, 1),
         group=top_group)

def create_table(stats):
    # Table widget:
    # bitdeli.Table(options)
    #
    # Displays a table of objects with keys as headers and values
    # as cell contents.
    #
    # Options:
    # data:   a list of objects
    # chart:  To visualize numbers inside the table, provide
    #         an object with {header_name: chart_type} pairings.
    #         The values in the corresponding column must be
    #         normalized between 0 and 1.
    #         ("bar" is the only type currently supported)
    Table(label='Top 10 customers by sales',
          data=list(stats.customer_data())[:10],
          chart={"Sales (rel)": "bar"},
          color=2,
          size=[12,6])

def create_timeline(stats):
    # Timeline widget:
    # bitdeli.Timeline(options)
    #
    # Displays a list of messages with optional avatars and timestamps.
    #
    # Options:
    # data:   a list of timeline event objects
    #
    # Event object fields:
    # gravatar_hash: a MD5 hash of the user's email address
    # username:      a string shown before the message
    # message:       a string that describes the event
    # color:         a theme color (integer between 1-3)
    # timestamp:     an ISO 8601 timestamp
    Timeline(label='Latest signups',
             data=list(stats.social_data())[:4],
             size=(4, 5))

def create_users(stats):
    # Users widget:
    # bitdeli.Users(options)
    #
    # Displays a list of users using avatar images from Gravatar.com.
    #
    # Options:
    # data:   a list of user objects
    # large:  True -> use double-size avatars (default: False)
    #
    # User object fields:
    # gravatar_hash: a MD5 hash of the user's email address
    # username:      a string shown when hovering over the avatar
    Users(label='Top customers today',
          large=True,
          size=(4, 4),
          data=list(stats.social_data())[:12])

def description(stats):
    # Set Title and Description
    # Note that you can dynamically generate both the title and
    # and the description based on the actual live data
    Title('Widgets Gallery')
    Description("""
        Currently Bitdeli supports %d themes. 
        Edit this card to see all of them in action.
    """ % len(get_themes()))

#
# Prepare data for widgets
#
class Stats(object):
    countries = Counter()
    daily_sales = Counter()
    daily_beer = Counter()
    feedback_pos = Counter()
    feedback_neg = Counter()
    returns = Counter()
    sales = Counter()
    users = {}

    def __init__(self):
        for profile in bitdeli.profiles():
            # Check the Profiles tab in the left side of the editor to see the
            # fields contained in each profile

            # Create objects for customer aggregates
            first_event = profile['events'][0]
            user = {'country': first_event['country'],
                    'stats': Counter()}
            if 'gravatar' in first_event:
                user['gravatar'] = first_event['gravatar']
            self.users[profile.uid] = user
                
            # Iterate over all events stored in the profile
            # and update metrics accordingly
            for event in profile['events']:
                if event['event'] == 'buy':
                    user['stats']['sales'] += event['price']
                    self.sales[event['product']] += 1
                    self.countries[event['country']] += event['price']
                    self.daily_sales[event['day']] += event['price']
                    if event['product'] == 'Beer':
                        self.daily_beer[event['day']] += event['price']
                if event['event'] == 'return':
                    user['stats']['returns'] += event['price']
                    self.returns[event['product']] += 1
                if event['event'] == 'feedback-positive':
                    user['stats']['pos'] += 1
                    self.feedback_pos[event['product']] += 1
                if event['event'] == 'feedback-negative':
                    user['stats']['neg'] += 1
                    self.feedback_neg[event['product']] += 1

    # Most liked products
    def most_liked(self):
        def score():
            for p in set(self.feedback_pos) | set(self.feedback_neg):
                s = self.feedback_pos.get(p, 0) - self.feedback_neg.get(p, 0)
                yield s, p
        return max(score())[1]

    # Prepare data for the customers table
    def customer_data(self):
        def rank_customers():
            customers = []
            for uid, u in self.users.iteritems():
                user = u.copy()
                del user['stats']
                user['id'] = uid
                user.update(u['stats'])
                customers.append(user)
            customers.sort(key=lambda c: c.get('sales', 0), reverse=True)
            return customers
        ranked = rank_customers()
        sales_top = ranked[0]['sales']
        for c in ranked:
            yield {"Country": c['country'],
                   "ID": c['id'],
                   "Feedback": ( "+%d/-%d" % (c.get('pos', 0),
                                              c.get('neg', 0)) ),
                   "Returns": ("$%d.00" % c.get('returns', 0)),
                   "Sales": ("$%d.00" % c.get('sales', 0)),
                   "Sales (rel)": float(c.get('sales', 0)) / sales_top}

    # Prepare data for the line widget
    def sales_data(self):
        def daily(sales):
            for i in range(30):
                tstamp = date.today() - timedelta(days=30-i)
                yield tstamp.isoformat(), sales[DAYS[i % 7]] / 100.
        return list(daily(self.daily_sales)),\
               list(daily(self.daily_beer))

    # Prepare data for the timeline and users widgets
    def social_data(self):
        for uid, user in self.users.iteritems():
            if 'gravatar' in user:
                yield dict(gravatar_hash=user['gravatar'],
                           username=uid,
                           message="Signed up from "+user['country'],
                           color=1,
                           timestamp=datetime.now().isoformat())
            

stats = Stats()
create_map(stats)
create_linechart(stats)
create_barchart(stats)
create_text(stats)
create_timeline(stats)
create_users(stats)
create_table(stats)
description(stats)
