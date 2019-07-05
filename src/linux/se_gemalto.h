/*****************************************************************************
 * Copyright ©2017-2019 Gemalto – a Thales Company. All rights Reserved.
 *
 * This copy is licensed under the Apache License, Version 2.0 (the "License");
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *     http://www.apache.org/licenses/LICENSE-2.0 or https://www.apache.org/licenses/LICENSE-2.0.html 
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.

 ****************************************************************************/

#ifndef SE_GEMALTO_H
#define SE_GEMALTO_H

#include <linux/types.h>

#define GTO_IOC_MAGIC           'g'

/* Read / Write of power configuration (GTO_POWER_ON, GTO_POWER_OFF) */
#define GTO_IOC_RD_POWER        _IOR(GTO_IOC_MAGIC, 1, __s32)
#define GTO_IOC_WR_POWER        _IOW(GTO_IOC_MAGIC, 1, __s32)

/* Read / Write of clock speed configuration */
#define GTO_IOC_RD_CLK_SPEED    _IOR(GTO_IOC_MAGIC, 2, __s32)
#define GTO_IOC_WR_CLK_SPEED    _IOW(GTO_IOC_MAGIC, 2, __s32)

#endif /* ifndef SE_GEMALTO_H */
