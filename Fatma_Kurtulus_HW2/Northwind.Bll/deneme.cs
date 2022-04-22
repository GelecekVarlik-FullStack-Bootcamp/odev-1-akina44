using Northwind.Entity.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Northwind.Bll
{
    class deneme
    {
        public void denemme(DtoCustomer entity)
        {
           
          var x =  ObjectMapper.Mapper.Map<DtoCustomer>(entity);
        }
    }
}
