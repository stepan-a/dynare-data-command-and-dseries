/* © Stéphane Adjemian 2017 <stephane.adjemian@univ-lemans.fr>
 *
 * This code is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with the code.  If not, see <http://www.gnu.org/licenses/>.
*/

var y;

varexo e;

parameters t1 t2 t3 t4 t5 t6 t7 t8 t9 ;

model;
  y = e + t1*e(-1) + t2*e(-2) + t3*e(-3) + t4*e(-4) + t5*e(-5) + t6*e(-6) + t7*e(-7) + t8*e(-8) + t9*e(-9) ;
end; 

// Create a dseries with data generated with an autoregressive process (from 1950Q1 to 2015Q4)
z = dseries(0, 1950Q1, 'y');                                          % First I set an initial condition.
u = dseries(randn(2050Q4-1950Q1+1,1), 1950Q1, 'u');                   % Second I sample innovations from a gaussian distribution.
rho = .50;
sig = .01
from $1950Q2 to $2050Q4 do z(t) = rho*z(t-1) + sig*u(t)               % Simulate an AR(1) model .

// Select the dataset
data(series=z, first_obs=1970Q1, last_obs=2050Q1);

estimated_params;
t1, rho;
t2, rho^2;
t3, rho^3;
t4, rho^4;
t5, rho^5;
t6, rho^6;
t7, rho^7;
t8, rho^8;
t9, rho^9;
stderr e, 0.02;
end;
     

varobs y;

estimation(mode_check);
