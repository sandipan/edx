# graphics.py
# Coded by George H. Chen (georgehc@mit.edu) -- updated 10/18/2016
import Tkinter as tk
from robot import GRID_WIDTH, GRID_HEIGHT
import math


# -----------------------------------------------------------------------------
# Some graphics constants
#

CELL_WIDTH = 25
CELL_HEIGHT = 25
PADDING = 20


# -----------------------------------------------------------------------------
# Graphics
#

class playback_positions(tk.Tk):

    def get_trapezoid_coords(self, x1, x2, y1, y2, direction):
        # for generating heat map polygons
        # 1/3 and 2/3
        y13 = y1 / 3. + y2 * 2. / 3.
        y23 = y1 * 2. / 3. + y2 / 3.
        x13 = x1 / 3. + x2 * 2. / 3.
        x23 = x1 * 2. / 3. + x2 / 3.
        if direction == 'up':
            vertices = [(x1, y1), (x2, y1), (x23, y13), (x13, y13)]
        elif direction == 'down':
            vertices = [(x1, y2), (x2, y2), (x23, y23), (x13, y23)]
        elif direction == 'left':
            vertices = [(x1, y1), (x1, y2), (x13, y23), (x13, y13)]
        elif direction == 'right':
            vertices = [(x2, y1), (x2, y2), (x23, y23), (x23, y13)]
        elif direction == 'stay':
            vertices = [(x13, y13), (x23, y13), (x23, y23), (x13, y23)]

        return vertices

    def __init__(self, true_positions, observed_positions,
                 estimated_positions, estimated_marginals, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)
        self.wm_title('Robot Demo')
        self.canvas = tk.Canvas(self,
                                width=GRID_WIDTH * CELL_WIDTH,
                                height=(GRID_HEIGHT * CELL_HEIGHT +
                                        PADDING) * 3,
                                borderwidth=0,
                                highlightthickness=0)
        self.canvas.pack(side='top', fill='both', expand='true')

        self.rect_top = {}
        self.rect_middle = {}
        self.rect_bottom = {}
        for column in range(GRID_WIDTH):
            for row in range(GRID_HEIGHT):
                x1 = column * CELL_WIDTH
                y1 = row * CELL_HEIGHT
                x2 = x1 + CELL_WIDTH
                y2 = y1 + CELL_HEIGHT
                self.rect_top[row, column] = \
                    self.canvas.create_rectangle(x1, y1, x2, y2,
                                                 fill='black',
                                                 tags='rect_top',
                                                 outline='gray11')

                y1 = row * CELL_HEIGHT + (GRID_HEIGHT * CELL_HEIGHT + PADDING)
                y2 = y1 + CELL_HEIGHT
                self.rect_middle[row, column] = \
                    self.canvas.create_rectangle(x1, y1, x2, y2,
                                                 fill='black',
                                                 tags='rect_middle',
                                                 outline='gray11')

                y1 = row * CELL_HEIGHT + \
                    2 * (GRID_HEIGHT * CELL_HEIGHT + PADDING)
                y2 = y1 + CELL_HEIGHT
                self.rect_bottom[row, column] = \
                    self.canvas.create_rectangle(x1, y1, x2, y2,
                                                 fill='black',
                                                 tags='rect_bottom',
                                                 outline='gray11')

        self.robot_top = self.canvas.create_oval(0, 0, 0, 0, fill='gray80')
        self.robot_top_arrow \
            = self.canvas.create_polygon(0, 0, 0, 0, 0, 0, 0, 0)
        self.canvas.create_text((GRID_WIDTH * CELL_WIDTH / 2.,
                                 GRID_HEIGHT * CELL_HEIGHT + PADDING / 3.),
                                text='True hidden state')

        self.robot_middle = self.canvas.create_oval(0, 0, 0, 0, fill='gray80')
        self.robot_middle_arrow \
            = self.canvas.create_polygon(0, 0, 0, 0, 0, 0, 0, 0)
        self.canvas.create_text((GRID_WIDTH * CELL_WIDTH / 2.,
                                 GRID_HEIGHT * CELL_HEIGHT + PADDING +
                                 GRID_HEIGHT * CELL_HEIGHT + PADDING / 3.),
                                text='Observed position')

        self.robot_bottom = self.canvas.create_oval(0, 0, 0, 0, fill='gray80')
        self.robot_bottom_arrow \
            = self.canvas.create_polygon(0, 0, 0, 0, 0, 0, 0, 0)
        self.canvas.create_text((GRID_WIDTH * CELL_WIDTH / 2.,
                                 (GRID_HEIGHT * CELL_HEIGHT + PADDING) * 2 +
                                 GRID_HEIGHT * CELL_HEIGHT + PADDING / 3.),
                                text='Estimated hidden state')

        # No robot or oval for the last area: just a heatmap

        self.canvas.create_text((GRID_WIDTH * CELL_WIDTH / 2.,
                                 (GRID_HEIGHT * CELL_HEIGHT + PADDING) * 3 +
                                 GRID_HEIGHT * CELL_HEIGHT + PADDING / 3.),
                                text='Estimated position distribution')
        self.redraw(true_positions, observed_positions, estimated_positions,
                    estimated_marginals, 200)

    def __move_robot(self, robot, robot_arrow, state, vertical_offset=0):
        if len(state) == 2:
            x, y = state
            action = None
        else:
            x, y, action = state

        x1 = x * CELL_WIDTH
        y1 = y * CELL_HEIGHT + vertical_offset
        x2 = x1 + CELL_WIDTH
        y2 = y1 + CELL_HEIGHT
        self.canvas.coords(robot, x1 + 2, y1 + 2, x2 - 2, y2 - 2)

        cx = (x1 + x2) / 2.
        cy = (y1 + y2) / 2.
        if action is None:
            self.canvas.coords(robot_arrow, 0, 0, 0, 0, 0, 0)
        elif action == 'stay':
            self.canvas.coords(robot_arrow,
                               cx - CELL_WIDTH / 5., cy - CELL_WIDTH / 5,
                               cx - CELL_WIDTH / 5., cy + CELL_WIDTH / 5,
                               cx + CELL_WIDTH / 5., cy + CELL_WIDTH / 5.,
                               cx + CELL_WIDTH / 5., cy - CELL_WIDTH / 5.)
        elif action == 'left':
            self.canvas.coords(robot_arrow,
                               cx - CELL_WIDTH / 4., cy,
                               cx - CELL_WIDTH / 4., cy,
                               cx + CELL_WIDTH / 8., cy - CELL_WIDTH / 4.,
                               cx + CELL_WIDTH / 8., cy + CELL_WIDTH / 4.)
        elif action == 'right':
            self.canvas.coords(robot_arrow,
                               cx + CELL_WIDTH / 4., cy,
                               cx + CELL_WIDTH / 4., cy,
                               cx - CELL_WIDTH / 8., cy - CELL_WIDTH / 4.,
                               cx - CELL_WIDTH / 8., cy + CELL_WIDTH / 4.)
        elif action == 'up':
            self.canvas.coords(robot_arrow,
                               cx, cy - CELL_HEIGHT / 4.,
                               cx, cy - CELL_HEIGHT / 4.,
                               cx - CELL_WIDTH / 4., cy + CELL_HEIGHT / 8.,
                               cx + CELL_WIDTH / 4., cy + CELL_HEIGHT / 8.)
        elif action == 'down':
            self.canvas.coords(robot_arrow,
                               cx, cy + CELL_HEIGHT / 4.,
                               cx, cy + CELL_HEIGHT / 4.,
                               cx - CELL_WIDTH / 4., cy - CELL_HEIGHT / 8.,
                               cx + CELL_WIDTH / 4., cy - CELL_HEIGHT / 8.)

    def move_robot_top(self, state):
        self.__move_robot(self.robot_top, self.robot_top_arrow, state)

    def move_robot_middle(self, state):
        self.__move_robot(self.robot_middle, self.robot_middle_arrow, state,
                          GRID_HEIGHT * CELL_HEIGHT + PADDING)

    def move_robot_bottom(self, state):
        self.__move_robot(self.robot_bottom, self.robot_bottom_arrow, state,
                          2 * (GRID_HEIGHT * CELL_HEIGHT + PADDING))

    def redraw(self, true_positions, observed_positions, estimated_positions,
               estimated_marginals, delay):
        if len(true_positions) == 0:
            self.destroy()
            # pass
        else:
            self.canvas.itemconfig('rect_top', fill='black',
                                   outline='gray11')
            self.canvas.itemconfig('rect_middle', fill='black',
                                   outline='gray11')
            self.canvas.itemconfig('rect_bottom', fill='black',
                                   outline='gray11')

            if true_positions[0] is not None:
                self.move_robot_top(true_positions[0])
            else:
                # hide robot
                self.move_robot_top((-10, -10))

                # turn grid red
                self.canvas.itemconfig('rect_top', fill='red3',
                                       outline='gray11')

            if observed_positions[0] is not None:
                self.move_robot_middle(observed_positions[0])
            else:
                # hide robot
                self.move_robot_middle((-10, -10))

                # turn grid red
                self.canvas.itemconfig('rect_middle', fill='red3',
                                       outline='gray11')

            if estimated_positions[0] is not None:
                self.move_robot_bottom(estimated_positions[0])
            else:
                # hide robot
                self.move_robot_bottom((-10, -10))

                # turn grid red
                self.canvas.itemconfig('rect_bottom', fill='red3',
                                       outline='gray11')

            if estimated_marginals[0] is not None:
                self.color_heatmap_grid(estimated_marginals[0])

            self.after(delay,
                       lambda: self.redraw(true_positions[1:],
                                           observed_positions[1:],
                                           estimated_positions[1:],
                                           estimated_marginals[1:],
                                           delay))

    def color_heatmap_grid(self, marginals):
        """
        Color the bottom map, based on the marginal distribution.  Ignores the
        robot's orientation (we marginalize that out).
        """
        position_dist = {}
        for x in range(GRID_WIDTH):
            for y in range(GRID_HEIGHT):
                position_dist[x, y] = 0.0

        for state, prob in marginals.items():
            position_dist[state[0], state[1]] += prob

        for x in range(GRID_WIDTH):
            for y in range(GRID_HEIGHT):
                # Make it easier to see the less likely states.
                color_mapper = lambda n: math.log(max(n, 0.00000000001))
                color = (color_mapper(position_dist[x, y]) - color_mapper(0.0)) \
                    / (color_mapper(1.0) - color_mapper(0.0)) * 255
                self.canvas.itemconfigure(
                    self.rect_bottom[
                        y, x], fill='#%02x%02x%02x' %
                    (int(color), 0, 0))
