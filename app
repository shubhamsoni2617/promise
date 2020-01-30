import React, { useState, useEffect } from 'react';
import axios from 'axios';
const Test = props => {
  const [titleArr, setTitleArr] = useState(() =>
    new Array(props.data.length).fill('test')
  );
  useEffect(() => {
    if (props.data.length) {
      let dataTitle = [...titleArr];
      props.data.map((id, index) => {
        axios
          .get('https://jsonplaceholder.typicode.com/todos/' + id)
          .then(res => {
            dataTitle[index] = res.data.title;
            setTitleArr([...dataTitle]);
          });
      });
    }
  }, [props.data]);

  console.log(titleArr);

  //getting intiial set value in  titleArr..
  //  ["test", "quis ut nam facilis et officia qui", "fugiat veniam minus"]
  return (
    <div>
      {titleArr.map((el, i) => {
        return <h2 key={i}>{el}</h2>;
      })}
    </div>
  );
};

export default Test;

// const [titleArr, setTitleArr] = useState(() => new Array(props.data.length).fill('test'));

//   useEffect(() => {
//     if (props.data.length) {
//       let dataTitle = [...titleArr];
//       props.data.map((id, index) => {
//         axios
//           .get('https://jsonplaceholder.typicode.com/todos/' + id)
//           .then(res => {
//             dataTitle[index] = res.data.title;
//             setTitleArr([...dataTitle]);
//           });
//       });
//     }
//   }, [props.data]);

// useEffect(() => {
//     if (props.data.length) {
//       const getTodos = async (idx) => {
//         return Promise.all(props.data.map(id => {
//           return axios
//             .get('https://jsonplaceholder.typicode.com/todos/' + id)
//             .then(res => res.data)
//         }))
//       }

//       getTodos(props.data).then(todos => {
//         // I wouldn't get rid of the rest of the todo just to keep the title, however.
//         setTitleArr(todos.map(todo => todo.title));
//       })
//     }
//   }, [props.data]);

// import React, { useState, useEffect } from "react";
// import axios from "axios";
// import "./styles.css";

// const propsData = [1, 2, 3];

// export default function App() {
//   const [titleArr, setTitleArr] = useState(() =>
//     new Array(propsData.length).fill("test")
//   );

//   useEffect(() => {
//     (async function() {
//       if (propsData.length) {
//         const titles = await Promise.all(
//           propsData.map(id => {
//             return axios
//               .get("https://jsonplaceholder.typicode.com/todos/" + id)
//               .then(res => {
//                 return res.data.title;
//               });
//           })
//         );
//         setTitleArr(titles);
//       }
//     })();
//   }, [propsData]);

//   return <div className="App">{JSON.stringify(titleArr)}</div>;
// }
