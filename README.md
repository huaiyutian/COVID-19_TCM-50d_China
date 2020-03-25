# COVID-19_TCM-50d_China

Code for: The role  of transmission control measures during the first 50 days of the COVID-19 epidemic in China

Citation

The role  of transmission control measures during the first 50 days of the COVID-19 epidemic in China

Huaiyu Tian, Yonghong Liu, Yidan Li, Chieh-Hsi Wu, Bin Chen, Moritz U.G. Kraemer, Bingying Li1, Jun Cai, Bo Xu, Qiqi Yang, Ben Wang, Peng Yang, Yujun Cui, Yimeng Song, Pai Zheng, Quanyi Wang, Ottar N. Bjornstad, Ruifu Yang, Bryan T. Grenfell, Oliver G. Pybus, and Christopher Dye.

doi: https://doi.org/10.1101/2020.01.30.20019844

Abstract

Respiratory illness caused by a novel coronavirus (COVID-19) appeared in China during December 2019. Attempting to contain infection, China banned travel to and from Wuhan city on 23 January and implemented a national emergency response. Here we evaluate the spread and control of the epidemic based on a unique synthesis of data including case reports, human movement and public health interventions. The Wuhan shutdown slowed the dispersal of infection to other cities by an estimated 2.91 days (95%CI: 2.54-3.29), delaying epidemic growth elsewhere in China. Other cities that implemented control measures pre-emptively reported 33.3% (11.1-44.4%) fewer cases in the first week of their outbreaks (13.0; 7.1-18.8) compared with cities that started control later (20.6; 14.5-26.8). Among interventions investigated here, the most effective were suspending intra-city public transport, closing entertainment venues and banning public gatherings. The national emergency response delayed the growth and limited the size of the COVID-19 epidemic and, by 19 February (day 50), had averted hundreds of thousands of cases across China.

Notes on the code

To run, you need a Matlab toolbox called "DRAM": 
DRAM is a combination of two ideas for improving the efficiency of Metropolis-Hastings type Markov chain Monte Carlo (MCMC) algorithms, Delayed Rejection and Adaptive Metropolis. This page explains the basic ideas behind DRAM and provides examples and Matlab code for the computations.(see http://helios.fmi.fi/~lainema/dram/)

Data

Epidemiological data

The COVID-19 cases data and transmission control measures implemented between 31 December 2019 and 19 February 2020 were collected from the official reports of the health commission of 34 provincial-level administrative units and 342 city-level units. The information was collected by Bingying Li.

Mobility data

Human movements were tracked with mobile phone data, through location-based services (LBS) employed by popular Tencent applications such as WeChat and QQ. Movement outflows from Wuhan City to other cities (i.e. records of the number of people leaving each day) by air, train and road, were obtained from the migration flows database (https://heat.qq.com/) from 13 January 2017 to 21 February 2017 (Spring Festival travel 2017), from 1 February 2018 to 12 March 2018 (Spring Festival travel 2018), and from 1 January 2018 to 31 December 2018 (entire 2018). Tecent's LBS data was collected and processed Dr.Bin Chen and Dr.Yimeng Song.

To reconstruct the movement outflow from Wuhan during the 2020 Spring Festival (from 11 January to 25 January, before the Chinese Lunar New Year), mobile phone data (provided by the telecommunications operators) were used together with the Baidu migration index (http://qianxi.baidu.com/); using both data sources gave the most accurate measure of movement volume. The expected movement outflows from Wuhan after the New Year festival from 26 January to 19 February.

License

(see LICENSE)

Additional license, warranty, and copyright information

We provide a license for our code (see LICENSE) and do not claim ownership, nor the right to license, the data we have obtained nor any third-party software tools/code used in our analyses. Please cite the appropriate agency, paper, and/or individual in publications and/or derivatives using these data, contact them regarding the legal use of these data, and remember to pass-forward any existing license/warranty/copyright information. THE DATA AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE DATA AND/OR SOFTWARE OR THE USE OR OTHER DEALINGS IN THE DATA AND/OR SOFTWARE.
